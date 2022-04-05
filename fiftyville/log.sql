-- Keep a log of any SQL queries you execute as you solve the mystery.

-- I've selected the id to search for extra information.

SELECT id FROM crime_scene_reports WHERE month = "7" AND day = "28" AND street = "Chamberlin Street";

-- The extra information (courthouse):

SELECT description FROM crime_scene_reports WHERE id = "295";

-- Look for suspects:

SELECT license_plate FROM courthouse_security_logs WHERE day = "28" AND hour = "10" AND minute >= "15" AND activity = "exit";

-- Select the name, phone, and passport number from the register of information of the drivers of the town, matching with the suspect license plates. The sooner it appears in the query, the greater the suspicion:

SELECT name, phone_number, passport_number FROM people WHERE license_plate IN (SELECT license_plate FROM courthouse_security_logs WHERE day = "28" AND hour = "10" AND minute >= "15" AND activity = "exit");

-- Look for transcripts matching only the name from the register of the information of the drivers of the town, looking for extra information (no results):

SELECT name FROM interviews WHERE name in (SELECT name FROM people WHERE license_plate IN (SELECT license_plate FROM courthouse_security_logs WHERE day = "28" AND hour = "10" AND minute >= "15" AND activity = "exit");

-- Looking for accomplices with phone calls:

SELECT receiver FROM phone_calls WHERE caller IN (SELECT phone_number FROM people WHERE license_plate IN (SELECT license_plate FROM courthouse_security_logs WHERE day = "28" AND hour = "10" AND minute >= "15" AND activity = "exit")) AND day = "28";

-- Looking for the name of the accomplice with the receiver numbers in the register of the information of the drivers of the town:

SELECT name FROM people WHERE phone_number IN (SELECT receiver FROM phone_calls WHERE caller IN (SELECT phone_number FROM people WHERE license_plate IN (SELECT license_plate FROM courthouse_security_logs WHERE day = "28" AND hour = "10" AND minute >= "15" AND activity = "exit")) AND day = "28");

-- Looking for the passport numbers of the suspects, filtering the ones that don't have a passport:

SELECT passport_number FROM people WHERE license_plate IN (SELECT license_plate FROM courthouse_security_logs WHERE day = "28" AND hour = "10" AND minute >= "15" AND activity = "exit") AND passport_number IS NOT NULL;

-- Looking for the flights id's of each suspect, matching the data recollected, and without losing the passport_number reference:

SELECT flight_id, passport_number FROM passengers WHERE passport_number IN (SELECT passport_number FROM people WHERE license_plate IN (SELECT license_plate FROM courthouse_security_logs WHERE day = "28" AND hour = "10" AND minute >= "15" AND activity = "exit") AND passport_number IS NOT NULL AND flight_id IN
(SELECT id FROM flights WHERE origin_airport_id = "8" AND day >= "28"));

-- Looking for the people's IDs of the filtered flights using the passport numbers:

SELECT phone_number FROM people WHERE passport_number IN (SELECT passport_number FROM passengers WHERE passport_number IN (SELECT passport_number FROM people WHERE license_plate IN (SELECT license_plate FROM courthouse_security_logs WHERE day = "28" AND hour = "10" AND minute >= "15" AND activity = "exit") AND passport_number IS NOT NULL AND flight_id IN
(SELECT id FROM flights WHERE origin_airport_id = "8" AND day >= "28")));

-- Test and error:

SELECT caller, receiver FROM phone_calls WHERE caller IN (SELECT phone_number FROM people WHERE passport_number IN (SELECT passport_number FROM passengers WHERE passport_number IN (SELECT passport_number FROM people WHERE license_plate IN (SELECT license_plate FROM courthouse_security_logs WHERE day = "28" AND hour = "10" AND minute >= "15" AND activity = "exit") AND passport_number IS NOT NULL AND flight_id IN
(SELECT id FROM flights WHERE origin_airport_id = "8" AND day >= "28"))) AND day = "28");

SELECT name FROM people WHERE phone_number IN (SELECT caller FROM phone_calls WHERE caller IN (SELECT phone_number FROM people WHERE passport_number IN (SELECT passport_number FROM passengers WHERE passport_number IN (SELECT passport_number FROM people WHERE license_plate IN (SELECT license_plate FROM courthouse_security_logs WHERE day = "28" AND hour = "10" AND minute >= "15" AND activity = "exit") AND passport_number IS NOT NULL AND flight_id IN
(SELECT id FROM flights WHERE origin_airport_id = "8" AND day >= "28"))) AND day = "28"));

SELECT id FROM people WHERE phone_number IN (SELECT receiver FROM phone_calls WHERE caller IN (SELECT phone_number FROM people WHERE passport_number IN (SELECT passport_number FROM passengers WHERE passport_number IN (SELECT passport_number FROM people WHERE license_plate IN (SELECT license_plate FROM courthouse_security_logs WHERE day = "28" AND hour = "10" AND minute >= "15" AND activity = "exit") AND passport_number IS NOT NULL AND flight_id IN
(SELECT id FROM flights WHERE origin_airport_id = "8" AND day >= "28"))) AND day = "28"));

SELECT account_number FROM bank_accounts WHERE person_id IN (SELECT id FROM people WHERE phone_number IN (SELECT receiver FROM phone_calls WHERE caller IN (SELECT phone_number FROM people WHERE passport_number IN (SELECT passport_number FROM passengers WHERE passport_number IN (SELECT passport_number FROM people WHERE license_plate IN (SELECT license_plate FROM courthouse_security_logs WHERE day = "28" AND hour = "10" AND minute >= "15" AND activity = "exit") AND passport_number IS NOT NULL AND flight_id IN
(SELECT id FROM flights WHERE origin_airport_id = "8" AND day >= "28"))) AND day = "28")));

SELECT account_number FROM atm_transactions WHERE account_number IN (SELECT account_number FROM bank_accounts WHERE person_id IN (SELECT id FROM people WHERE phone_number IN (SELECT receiver FROM phone_calls WHERE caller IN (SELECT phone_number FROM people WHERE passport_number IN (SELECT passport_number FROM passengers WHERE passport_number IN (SELECT passport_number FROM people WHERE license_plate IN (SELECT license_plate FROM courthouse_security_logs WHERE day = "28" AND hour = "10" AND minute >= "15" AND activity = "exit") AND passport_number IS NOT NULL AND flight_id IN
(SELECT id FROM flights WHERE origin_airport_id = "8" AND day >= "28"))) AND day = "28"))) AND day >= "28" AND transaction_type = "withdraw");

SELECT person_id FROM bank_accounts WHERE account_number IN (SELECT account_number FROM atm_transactions WHERE account_number IN (SELECT account_number FROM bank_accounts WHERE person_id IN (SELECT id FROM people WHERE phone_number IN (SELECT receiver FROM phone_calls WHERE caller IN (SELECT phone_number FROM people WHERE passport_number IN (SELECT passport_number FROM passengers WHERE passport_number IN (SELECT passport_number FROM people WHERE license_plate IN (SELECT license_plate FROM courthouse_security_logs WHERE day = "28" AND hour = "10" AND minute >= "15" AND activity = "exit") AND passport_number IS NOT NULL AND flight_id IN
(SELECT id FROM flights WHERE origin_airport_id = "8" AND day >= "28"))) AND day = "28"))) AND day >= "28" AND transaction_type = "withdraw"));

SELECT phone_number, name FROM people WHERE id IN (SELECT person_id FROM bank_accounts WHERE account_number IN (SELECT account_number FROM atm_transactions WHERE account_number IN (SELECT account_number FROM bank_accounts WHERE person_id IN (SELECT id FROM people WHERE phone_number IN (SELECT receiver FROM phone_calls WHERE caller IN (SELECT phone_number FROM people WHERE passport_number IN (SELECT passport_number FROM passengers WHERE passport_number IN (SELECT passport_number FROM people WHERE license_plate IN (SELECT license_plate FROM courthouse_security_logs WHERE day = "28" AND hour = "10" AND minute >= "15" AND activity = "exit") AND passport_number IS NOT NULL AND flight_id IN
(SELECT id FROM flights WHERE origin_airport_id = "8" AND day >= "28"))) AND day = "28"))) AND day >= "28" AND transaction_type = "withdraw")));

SELECT name, passport_number FROM people WHERE phone_number IN (SELECT phone_number FROM people WHERE id IN (SELECT person_id FROM bank_accounts WHERE account_number IN (SELECT account_number FROM atm_transactions WHERE account_number IN (SELECT account_number FROM bank_accounts WHERE person_id IN (SELECT id FROM people WHERE phone_number IN (SELECT receiver FROM phone_calls WHERE caller IN (SELECT phone_number FROM people WHERE passport_number IN (SELECT passport_number FROM passengers WHERE passport_number IN (SELECT passport_number FROM people WHERE license_plate IN (SELECT license_plate FROM courthouse_security_logs WHERE day = "28" AND hour = "10" AND minute >= "15" AND activity = "exit") AND passport_number IS NOT NULL AND flight_id IN
(SELECT id FROM flights WHERE origin_airport_id = "8" AND day >= "28"))) AND day = "28"))) AND day >= "28" AND transaction_type = "withdraw"))));

SELECT name, passport_number FROM people WHERE phone_number = "(367) 555-5533";

SELECT flight_id FROM passengers WHERE passport_number = "5773159633";

SELECT phone_number FROM people WHERE id IN (SELECT person_id FROM bank_accounts WHERE account_number IN (SELECT account_number FROM bank_accounts WHERE person_id IN (SELECT id FROM people WHERE phone_number IN (SELECT receiver FROM phone_calls WHERE caller IN (SELECT phone_number FROM people WHERE passport_number IN (SELECT passport_number FROM passengers WHERE passport_number IN (SELECT passport_number FROM people WHERE license_plate IN (SELECT license_plate FROM courthouse_security_logs WHERE day = "28" AND hour = "10" AND minute >= "15" AND activity = "exit") AND passport_number IS NOT NULL AND flight_id IN
(SELECT id FROM flights WHERE origin_airport_id = "8" AND day >= "28"))) AND day = "28")))));

--