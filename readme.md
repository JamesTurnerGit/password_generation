# Password Generation tool

## Description of the task
build a password generator that can create random passwords using the following interface.

generatePassword(length, uppercase, lowercase, number, special)

where length is the length of the password and the rest of the arguments describe which characters are allowed to be used.

## Approach

To tackle this challenge i've split the task up into two parts, The first part of the problem is building a list of valid characters up, The second is to select the right number of random elements of this list

## Possible improvements

* reseeding the RNG - with the code as it is there's a possible security risk if someone could find out the current state of the RNG.
* using named vars - Held off of this because the spec of this challenge specified this exact interface. If this was production I'd consider adding an extra method to the password generator which simply unpacks named vars in the right order and calls the original one, or maybe an overloaded version of the original method.

## Areas where i've strayed from the task

I've packed the generate_password method into a module, and renamed it to match ruby conventions. This gave me a sensible place to store constants without poluting the global namespace

I've added defaults to make it a less clunky password generation tool
