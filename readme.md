# Enigma

The Enigma Project contains file's that allow you to encrypt, decrypt, and crack files from your terminal inside of the enigma directory.

#### Encryptor
This is the file that allows you to encrypt messages.     
In order to do this you may type:

$ ruby encryptor.rb message.txt encrypted.txt *(codeword) (date)*

-- encryptor.rb -- is the file that is encrypting the text.  
-- message.txt -- is the file that is being encrypted.   
-- encrypted.txt -- is the text file with the encrypted message.   
-- *(codeword)* -- is an optional argument that allows you to use your own codeword. If no codeword is selected, the program will randomly generate a codeword.      
-- *(date)* -- is an optional argument that allows you to select a date to encrypt. If no date is selected, the default is today's date. The format for entering a date is "year-mm-dd".

#### Decryptor
This is the file that allows you to decrypt your encrypted messages.     
In order to do this you will type:

$ ruby decryptor.rb encrypted.txt decrypted.txt (codeword) *(date)*

-- decryptor.rb -- is the file that is decrypting the text.     
-- encrypted.txt -- is the file that is being decrypted.     
-- decrypted.txt -- is the file with the decrypted message.     
-- (codeword) -- is the codeword that was generated during the encryption.
-- *(date)* -- is an optional argument that allows you to select a date to decrypt. If no date is selected, the default is today's date. The format for entering a date is "year-mm-dd".  

#### Cracker
This is the file that allows you to decrypt an encrypted message without knowing the key.
In order to do this you will type:    

$ ruby cracker.rb encrypted.txt cracked.txt *(date)*

-- cracker.rb -- is the file that is cracking the text.     
-- encrypted.txt -- is the file that is being cracked.     
-- cracked.txt -- is the file that contains the cracked message.     
-- *(date)* -- is an optional argument that allows you to select a date to crack by. If no date is selected, the default is today's date. The format for entering a date is "year-mm-dd".
