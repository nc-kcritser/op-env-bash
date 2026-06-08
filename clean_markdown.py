import wordninja
import re

# File paths
input_file = 'bcm11-install-manual.md'
output_file = 'bcm11-install-manual-cleaned.md'

def split_crammed_words(match):
    # Extracts the crammed string
    crammed_string = match.group(0)
    # wordninja intelligently splits the string into a list of words
    split_words = wordninja.split(crammed_string)
    # Rejoin them with spaces
    return ' '.join(split_words)

with open(input_file, 'r', encoding='utf-8') as f:
    content = f.read()

# This regex looks for blocks of letters longer than 20 characters without spaces.
# It uses 20 as a threshold so it doesn't accidentally split up actual long words, 
# standard code snippets, or regular hyphenated terminology.
cleaned_content = re.sub(r'[A-Za-z]{20,}', split_crammed_words, content)

with open(output_file, 'w', encoding='utf-8') as f:
    f.write(cleaned_content)

print(f"Cleaned text saved to {output_file}")