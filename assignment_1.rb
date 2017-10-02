require 'urban_dictionary'
require 'gingerice'

nothing = 'Yesterdiy I went with my brather to a niw gym in Markham. Mang, those dudes were filthy rich. It was like money was growing off their bazooties.Everything they wore was branded from their head to their toes.They were ballin with their new, clean, white, nike shoes and all their nice isht. But we minded our own bizznizzle because we were just there to play some volleyball LMAO. Then when everyone started the drills, the place got crunked up. Everyone was smashing the balls like no tomorrow. It was mad-crazy in that joint.But mang, that was by far the best volleyball practice ever.'
$original_corrections = []

puts "Welcome to Slango!"
puts "Enter some text to Slango: "

text = gets.chomp
parser = Gingerice::Parser.new
output = parser.parse text

puts "------------------------"
puts "RESULT: "
puts output["result"]
puts "------------------------"
puts "TOTAL NUMBER OF CORRECTIONS: #{output["corrections"].length}"
output["corrections"].each do |correction|
	puts "#{correction["text"]} was corrected to: #{correction["correct"]}"
	$original_corrections.push(correction["text"])
end

puts "------------------------"
puts "Would you like to save these results to a text file?"
users_choice2 = gets.chomp.downcase
if users_choice2 == "y"
	puts "What would you like to name your file?"
	file_name_choice = gets.chomp.downcase
	File.write("#{file_name_choice}.rb", output["result"])
elsif users_choice2 == "n"
else
	puts "I didn't understand that."
end

puts "------------------------"
puts "Would you like to search UrbanDictionary for any of these words? y/n"
users_choice = gets.chomp.downcase
if users_choice == "y"
	puts "Which word would you like to search? "
	users_word = gets.chomp
	word = UrbanDictionary.define(users_word)
	word.entries.each do |entry|
	  puts entry.definition
	end
elsif users_choice == "n"
	puts "Thanks for using Slango."
else
	puts "I didn't understand that."
end

