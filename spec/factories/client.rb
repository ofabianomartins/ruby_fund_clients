FactoryBot.define do
	factory :client do
		name { "José" }
	  birthdate { Date.parse("2000-01-03") }
    identification_number { "4444444444444444" }
  end
end
