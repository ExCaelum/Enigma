## Enigma

#### Enigma Methods
encrypt(message, key, Date) - allows you to encrypt a custom message. The key and date are optional, they default to a random key, and the current date.

decrypt(message, key, Date) - decrypts an encrypted message is the date and key are known

#### OffsetCalculator Methods
OffsetCalculator.new(key, date) - creates a key and date.

calculate_code - takes the key and date that the OffsetCalculator.new was initialized with and creates a hash with the shift values.
