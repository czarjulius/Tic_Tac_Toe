
class LanguageOption
    def initialize(language_setting, input=STDIN)
        @language_setting = language_setting
        @input = input

    end

    def chose_language
        puts "Please chose your preferred language"
        puts "1. English"
        puts "2. Igbo"
        print "Choice: "

        language_choice = @input.gets.chomp
        if language_choice == "1"
            return @language_setting["English"]
        else
            return @language_setting["Igbo"]
        end

    end
    
end