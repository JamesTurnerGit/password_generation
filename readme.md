# Password Generation tool

## Description of the task
build a password generator that can create random passwords using the following interface.

generatePassword(length, uppercase, lowercase, number, special)

where length is the length of the password and the rest of the arguments describe which characters are allowed to be used.

## Approach

To tackle this challenge i've split the task up into two parts, The first part of the problem is building a list of valid characters up, The second is to select the right number of random elements of this list

It might seem like a good idea to enforce rules like "at least one number" - but this actually decreases the security of a password by reducing the search-space a brute force attacker would need to use.

## Possible improvements

* reseeding the RNG - with the code as it is there's a possible security risk if someone could find out the current state of the RNG.
* using named vars - Held off of this because the spec of this challenge specified this exact interface. If this was part of a bigger project, I'd consider adding an extra method to the password generator which simply unpacks named vars in the right order and calls the original one, or maybe an overloaded version of the original method. This would allow legacy parts of code to use the method as expected, while allowing newer ones to use the updated interface safely.

## Areas where i've strayed from the given description

I've packed the generate_password method into a module, and renamed it to match ruby conventions. This gave me a sensible place to store constants without poluting the global namespace or writing them directly into the method. This is far more in-line with what i'd expect from a enviroment coded using ruby

I've added defaults to make it a less clunky password generation tool, length 8 and all chars will be used.
