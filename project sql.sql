use erd;

CREATE TABLE UserActivity1(
    User_ID INT NOT NULL DEFAULT 0,
    Age INT NOT NULL DEFAULT 0,
    Gender VARCHAR(10) NOT NULL DEFAULT 'Unknown',
    Platform VARCHAR(50) NOT NULL DEFAULT 'Unknown',
    Daily_Usage_Time INT NOT NULL DEFAULT 0,
    Posts_Per_Day INT NOT NULL DEFAULT 0,
    Likes_Received_Per_Day INT NOT NULL DEFAULT 0,
    Comments_Received_Per_Day INT NOT NULL DEFAULT 0,
    Messages_Sent_Per_Day INT NOT NULL DEFAULT 0,
    Dominant_Emotion VARCHAR(50) NOT NULL DEFAULT 'Unknown',
    Unnamed_10 VARCHAR(50) NOT NULL DEFAULT ''
);
LOAD DATA INFILE 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\val sample.csv'
INTO TABLE UserActivity1
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS
(@User_ID, @Age, @Gender, @Platform, @Daily_Usage_Time, @Posts_Per_Day, @Likes_Received_Per_Day, @Comments_Received_Per_Day, @Messages_Sent_Per_Day, @Dominant_Emotion, @Unnamed_10)
SET 
    User_ID = IF(@User_ID = '', 0, @User_ID),
    Age = IF(@Age = '', 0, @Age),
    Gender = IF(@Gender = '', 'Unknown', @Gender),
    Platform = IF(@Platform = '', 'Unknown', @Platform),
    Daily_Usage_Time = IF(@Daily_Usage_Time = '', 0, @Daily_Usage_Time),
    Posts_Per_Day = IF(@Posts_Per_Day = '', 0, @Posts_Per_Day),
    Likes_Received_Per_Day = IF(@Likes_Received_Per_Day = '', 0, @Likes_Received_Per_Day),
    Comments_Received_Per_Day = IF(@Comments_Received_Per_Day = '', 0, @Comments_Received_Per_Day),
    Messages_Sent_Per_Day = IF(@Messages_Sent_Per_Day = '', 0, @Messages_Sent_Per_Day),
    Dominant_Emotion = IF(@Dominant_Emotion = '', 'Unknown', @Dominant_Emotion);

