import mysql.connector
from datetime import datetime

# Emoji representation using Unicode
happy_face = "\U0001F604"  # Unicode for smiling face emoji
danger_emoji = "\u26A0"
namaskar_emoji = "\U0001F64F"

# Function to fetch data from the database
def fetch_data(mycursor, table, column, condition_column, condition_value):
    query = f"SELECT {column} FROM {table} WHERE {condition_column} = %s"
    try:
        mycursor.execute(query, (condition_value,))
        result = mycursor.fetchall()  # Fetch all rows to avoid unread result errors
        if result:
            values = [row[0] for row in result]  # Return the first column of each row
            return values
        else:
            print(f"No data found in {table} with {condition_column} = {condition_value}.")
            return []
    except mysql.connector.Error as err:
        print(f"Error fetching data: {err}")
        return []

# Function to input meeting time
def input_time():
    while True:
        time_input = input("\nEnter the meeting time (HH:MM:SS): ")
        try:
            # Attempt to parse the input as a valid time
            time_obj = datetime.strptime(time_input, "%H:%M:%S").time()
            return time_obj
        except ValueError:
            print("Invalid time format. Please use HH:MM:SS.")

# Function to get train details
def get_train_details(mycursor, table, meeting_time):
    train_names = fetch_data(mycursor, table, "Train_name", "Meet", meeting_time)
    if train_names:
        passing_times = [fetch_data(mycursor, table, "Meet", "Train_name", train_name) for train_name in train_names]
        # Flatten the list of lists and return train names with their corresponding times
        return [(train_name, times[0]) for train_name, times in zip(train_names, passing_times) if times]
    return []

# Function to handle "UPLINE and DOWNLINE" scenario
def handle_upline_and_downline(mycursor, meeting_time):
    # Fetch value1 and value3 from UPLINE table
    table1 = "UPLINE"
    value3 = get_train_details(mycursor, table1, meeting_time)
    if value3:
        train1, passing_time1 = value3[0]
        print(f"\nTrain from UPLINE: {train1} passing time: {passing_time1}")

    # Fetch value2 from DOWNLINE table
    table2 = "DOWNLINE"
    value4 = get_train_details(mycursor, table2, meeting_time)
    if value4:
        train2, passing_time2 = value4[0]
        print(f"Train from DOWNLINE: {train2} passing time: {passing_time2}")

    if value3 and value4:
        x = int(input("\nEnter the DOWNLINE: "))
        y = int(input("Enter the UPLINE:"))

        if passing_time1 == passing_time2:
            if x == y:
                print(f"{danger_emoji} Trains on the same line {danger_emoji}")
            else:
                print(f"{namaskar_emoji}{happy_face} Happy Journey {happy_face}{namaskar_emoji}")
        else:
            print(f"{namaskar_emoji}{happy_face} Happy Journey {happy_face}{namaskar_emoji}")
    else:
        print("No matching trains found in both UPLINE and DOWNLINE.")

# Function to handle "UPLINE or DOWNLINE" scenario
def handle_upline_or_downline(mycursor, line_choice, meeting_time):
    if line_choice == 0:
        table = "UPLINE"
    else:
        table = "DOWNLINE"

    trains = get_train_details(mycursor, table, meeting_time)
    if trains:
        for train_name, passing_time in trains:
            print(f"\nTrain from {table}: {train_name} passing time: {passing_time}")

        if len(trains) >= 2:
            value1, value2 = trains[0][1], trains[1][1]
            x = int(input("\nEnter the DOWNLINE: "))
            y = int(input("Enter the UPLINE:"))

            if value1 == value2:
                if x == y:
                    print(f"{danger_emoji} Trains on the same line {danger_emoji}")
                else:
                    print(f"{namaskar_emoji}{happy_face} Happy Journey {happy_face}{namaskar_emoji}")
            else:
                print(f"{namaskar_emoji}{happy_face} Happy Journey {happy_face}{namaskar_emoji}")
    else:
        print("No trains found for the specified meeting time.")

# Main function
def main():
    try:
        mydb = mysql.connector.connect(
            host='localhost',
            user='root',
            password='Kiran@1234',
            database='project'
        )
        mycursor = mydb.cursor()

        print(f"{namaskar_emoji} WELCOME TO INDIAN RAILWAYS {namaskar_emoji}")

        print("Enter 0 for UPLINE and DOWNLINE")
        print("Enter 1 for UPLINE or DOWNLINE")
        mode_choice = int(input("Enter your choice: "))

        if mode_choice not in [0, 1]:
            print("Invalid choice. Please enter 0 or 1.")
            return

        meeting_time = input_time()
        print(f"Meeting time entered: {meeting_time}")

        if mode_choice == 0:
            handle_upline_and_downline(mycursor, meeting_time)
        else:
            print("Enter 0 for UPLINE")
            print("Enter 1 for DOWNLINE")
            line_choice = int(input("Enter your choice: "))

            if line_choice not in [0, 1]:
                print("Invalid choice. Please enter 0 for UPLINE or 1 for DOWNLINE.")
                return

            handle_upline_or_downline(mycursor, line_choice, meeting_time)

        # Commit changes and close connection
        mydb.commit()

    except mysql.connector.Error as err:
        print(f"Error connecting to MySQL: {err}")

    finally:
        if mydb.is_connected():
            mycursor.close()
            mydb.close()

if __name__ == "__main__":
    main()
