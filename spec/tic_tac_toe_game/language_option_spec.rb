require "json"
require_relative '../../lib/console/language_option.rb'
require_relative 'fake_input'


RSpec.describe LanguageOption do
    context "#language_choices" do
        it "Should accept English language" do
            languages = {"English" => "Englishtranslations", "Igbo" => "igbotranslations"}
            fakeinput = FakeInput.new("1")
            l_option = LanguageOption.new(languages, fakeinput)
            expect(l_option.chose_language).to eq "Englishtranslations"
        end
        it "Should accept Igbo language" do
            languages = {"English" => "Englishtranslations", "Igbo" => "igbotranslations"}
            fakeinput = FakeInput.new("2")
            l_option = LanguageOption.new(languages, fakeinput)
            expect(l_option.chose_language).to eq "igbotranslations"
        end
    end
end

