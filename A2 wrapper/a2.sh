#!/bin/bash

# 1. Echo “The” and a space to the file sentence.txt (use > to overwrite any previous file)
echo -n "The " > sentence.txt

# 2. Change to the adjectives directory
cd ./A2/adjectives

# 3. Pick a random file from the adjectives directory and write its name to sentence.txt (Use >> to append to the sentence.txt file)
# first, CHECK WRITE PERMISSIONS
if [ ! -w "../../sentence.txt" ]; then
  chmod +w ../../sentence.txt
fi

echo -n $(ls | sort -R | head -n 1 | tr -d "\n") >> ../../sentence.txt

# 4. Echo a space to the sentence.txt file (Use >>)
echo -n " " >> ../../sentence.txt

# 5. Change to the nouns directory
cd ../nouns

# 6. Pick a random file from the nouns directory and write its name to sentence.txt (Use >>)
echo -n $(ls | sort -R | head -n 1 | tr -d "\n") >> ../../sentence.txt

# 7. Echo a space to the sentence.txt file (Use >>)
echo -n " " >> ../../sentence.txt

# 8. Change to the adverbs directory
cd ../adverbs

# 9. Pick a random file from the adverbs directory and write its name to sentence.txt (Use >>)
echo -n $(ls | sort -R | head -n 1 | tr -d "\n") >> ../../sentence.txt

# 10. Echo a space to the sentence.txt file (Use >>)
echo -n " " >> ../../sentence.txt

# 11. Change to the verbs directory
cd ../verbs

# 12. Pick a random file from the verbs directory and write its name to sentence.txt (Use >>)
echo -n $(ls | sort -R | head -n 1 | tr -d "\n") >> ../../sentence.txt

# 13. Echo a space to the sentence.txt file (Use >>)
echo -n " " >> ../../sentence.txt

# 14. Echo "the " to the sentence.txt file (Use >>)
echo -n "the " >> ../../sentence.txt

# 15. Change to the adjectives directory
cd ../adjectives

# 16. Pick a random file from the adjectives directory and write its name to sentence.txt (Use >>)
echo -n $(ls | sort -R | head -n 1 | tr -d "\n") >> ../../sentence.txt

# 17. Echo a space to the sentence.txt file (Use >>)
echo -n " " >> ../../sentence.txt

# 18. Change to the nouns directory
cd ../nouns

# 19. Pick a random file from the nouns directory and write its name to sentence.txt (Use >>)
echo -n $(ls | sort -R | head -n 1 | tr -d "\n") >> ../../sentence.txt

# 20. Echo a period to the sentence.txt file (Use >>)
echo "." >> ../../sentence.txt

cat ../../sentence.txt




