require 'rails_helper'

RSpec.describe User, type: :model do

  let(:user) { user =  User.new({ fullname: "John Doe", gender: "Male", date_of_birth: "2002-05-03", citizen_id: 1234567891234, address: "123, Lardkrabang", contact_number: "123456789", password: "123456789", password_confirmation: "123456789", role: 0 }).save }

  context "All field must be filled" do
    it "it cannot create, fullname required" do 
      user =  User.new({ fullname: "", gender: "Male", date_of_birth: "2002-05-03", citizen_id: 1234567891234, address: "123, Lardkrabang", contact_number: "123456789", password: "123456789", password_confirmation: "123456789", role: 0 }).save 
      expect(user).to eq(false)
    end
    it "it cannot create, gender required" do 
      user =  User.new({ fullname: "jason", date_of_birth: "2002-05-03", citizen_id: 10101010, address: "123, Lardkrabang", contact_number: "123456789", password: "123456789", password_confirmation: "123456789", role: 0 }).save
      expect(user).to eq(false)
    end
    it "it cannot create, date of birth required" do 
      user =  User.new({ fullname: "jason",gender: "Male", citizen_id: 10101010, address: "123, Lardkrabang", contact_number: "123456789", password: "123456789", password_confirmation: "123456789", role: 0 }).save
      expect(user).to eq(false)
    end
    it "it cannot create, citizen id required" do 
      user =  User.new({fullname: "jason", gender: "Male", date_of_birth: "2002-05-03",  address: "123, Lardkrabang", contact_number: "123456789", password: "123456789", password_confirmation: "123456789", role: 0 }).save
      expect(user).to eq(false)
    end
    it "it cannot create, address required" do 
      user =  User.new({ fullname: "jason",gender: "Male", date_of_birth: "2002-05-03", citizen_id: 10101010,  contact_number: "123456789", password: "123456789", password_confirmation: "123456789", role: 0 }).save
      expect(user).to eq(false)
    end
    it "it cannot create, contact number required" do 
      user =  User.new({ fullname: "jason",gender: "Male", date_of_birth: "2002-05-03", citizen_id: 10101010,  address: "123, Lardkrabang", password: "123456789", password_confirmation: "123456789", role: 0 }).save
      expect(user).to eq(false)
    end
    it "it can create new user successfully" do 
      user =  User.new({ fullname: "John Doe", gender: "Male", date_of_birth: "2002-05-03", citizen_id: 1010101010101, address: "123, Lardkrabang", contact_number: "123456789", password: "123456789", password_confirmation: "123456789", role: 0 }).save
      expect(user).to eq(true)
    end
  end

  context "citizen id field" do
    # it "cannot fill citizen id with thai format" do
    #   user =  User.new({ fullname: "Test", gender: "Male", date_of_birth: "2002-05-03", citizen_id: ๑๒๓๔๕๖๗๘๙, address: "123, Lardkrabang", contact_number: "123456789", password: "123456789", password_confirmation: "123456789", role: 0 }).save
    #   expect(user).to raise_error("Citizen ID should be arabic number")
    # end
    it "citizen id is less than 13" do
      user =  User.new({ fullname: "Test", gender: "Male", date_of_birth: "2002-05-03", citizen_id: 123456789123 , address: "123, Lardkrabang", contact_number: "123456789", password: "123456789", password_confirmation: "123456789", role: 0 }).save
      expect(user).to eq(false)
    end
    it "citizen id is greater than 13" do
      user =  User.new({ fullname: "Test", gender: "Male", date_of_birth: "2002-05-03", citizen_id: 12345678912345 , address: "123, Lardkrabang", contact_number: "123456789", password: "123456789", password_confirmation: "123456789", role: 0 }).save
      expect(user).to eq(false)
    end
    it "citizen id is equal to 13" do
      user =  User.new({ fullname: "John Doe", gender: "Male", date_of_birth: "2002-05-03", citizen_id: 1234567891234, address: "123, Lardkrabang", contact_number: "123456789", password: "123456789", password_confirmation: "123456789", role: 0 }).save
      expect(user).to eq(true)
    end
  end

  context "fullname field" do
    it "cannot filled with special symbol" do 
      user =  User.new({ fullname: "!@##", gender: "Male", date_of_birth: "2002-05-03", citizen_id: 1010101010101, address: "123, Lardkrabang", contact_number: "123456789", password: "123456789", password_confirmation: "123456789", role: 0 }).save
      expect(user).to eq(false)
    end
    it "cannot filled without space bar" do 
      user =  User.new({ fullname: "AbdulhakimMaha", gender: "Male", date_of_birth: "2002-05-03", citizen_id: 1010101010101, address: "123, Lardkrabang", contact_number: "123456789", password: "123456789", password_confirmation: "123456789", role: 0 }).save
      expect(user).to eq(false)
    end
    it "cannot filled with number" do 
      user =  User.new({ fullname: "Abdulhak1m Maha", gender: "Male", date_of_birth: "2002-05-03", citizen_id: 1010101010101, address: "123, Lardkrabang", contact_number: "123456789", password: "123456789", password_confirmation: "123456789", role: 0 }).save
      expect(user).to eq(false)
    end
    it "can filled with thai charactor" do 
      user =  User.new({ fullname: "อับดุลฮากิม มาหะ", gender: "Male", date_of_birth: "2002-05-03", citizen_id: 1010101010101, address: "123, Lardkrabang", contact_number: "123456789", password: "123456789", password_confirmation: "123456789", role: 0 }).save
      expect(user).to eq(true)
    end
    it "can filled with english charactor" do 
      user =  User.new({ fullname: "Abulhakim Mah", gender: "Male", date_of_birth: "2002-05-03", citizen_id: 1010101010101, address: "123, Lardkrabang", contact_number: "123456789", password: "123456789", password_confirmation: "123456789", role: 0 }).save
      expect(user).to eq(true)
    end
  end

  context "gender field" do
    it "can thick for male's gender" do
      user =  User.new({ fullname: "Abulhakim Mah", gender: "Male", date_of_birth: "2002-05-03", citizen_id: 1010101010101, address: "123, Lardkrabang", contact_number: "123456789", password: "123456789", password_confirmation: "123456789", role: 0 }).save
      expect(user).to eq(true)
    end
    it "can thick for female's gender" do
      user =  User.new({ fullname: "Abulhakim Mah", gender: "Female", date_of_birth: "2002-05-03", citizen_id: 1010101010101, address: "123, Lardkrabang", contact_number: "123456789", password: "123456789", password_confirmation: "123456789", role: 0 }).save
      expect(user).to eq(true)
    end
    it "can thick for others's gender" do
      user =  User.new({ fullname: "Abulhakim Mah", gender: "Others", date_of_birth: "2002-05-03", citizen_id: 1010101010101, address: "123, Lardkrabang", contact_number: "123456789", password: "123456789", password_confirmation: "123456789", role: 0 }).save
      expect(user).to eq(true)
    end
    it "cannot create with other than [Male, Female, Others]" do
      user =  User.new({ fullname: "Abulhakim Mah", gender: "Anything", date_of_birth: "2002-05-03", citizen_id: 1010101010101, address: "123, Lardkrabang", contact_number: "123456789", password: "123456789", password_confirmation: "123456789", role: 0 }).save
      expect(user).to eq(false)
    end
  end


  # rails convert dd-mm-yyyy to yyyy-mm-dd automaticaaly.
  context "date of birth field" do 


    # it "cannot create with format dd-mm-yyyy" do
    #   user =  User.new({ fullname: "Abulhakim Mah", gender: "Male", date_of_birth: "30-05-2002", citizen_id: 1010101010101, address: "123, Lardkrabang", contact_number: "123456789", password: "123456789", password_confirmation: "123456789", role: 0 }).save
    #   # expect(user).to raise_error("the format should be yyyy-mm-dd")
    #   expect(user).to eq(false)
    # end
    it "cannot create with the invalid date of birth (the date in the future)" do
      user =  User.new({ fullname: "Abulhakim Mah", gender: "Male", date_of_birth: "3030-05-03", citizen_id: 1010101010101, address: "123, Lardkrabang", contact_number: "123456789", password: "123456789", password_confirmation: "123456789", role: 0 }).save
      expect(user).to eq(false)
    end

    it "can create with the valid format yyyy-mm-dd" do 
      user =  User.new({ fullname: "Abulhakim Mah", gender: "Male", date_of_birth: "2002-05-03", citizen_id: 1010101010101, address: "123, Lardkrabang", contact_number: "123456789", password: "123456789", password_confirmation: "123456789", role: 0 }).save
      expect(user).to eq(true)
    end
  end

  context "address field" do
    it "can create with eng format" do 
      user =  User.new({ fullname: "Abulhakim Mah", gender: "Male", date_of_birth: "2002-05-03", citizen_id: 1010101010101, address: "123, Lardkrabang", contact_number: "123456789", password: "123456789", password_confirmation: "123456789", role: 0 }).save
      expect(user).to eq(true)
    end
    it "can create with thai format" do 
      user =  User.new({ fullname: "Abulhakim Mah", gender: "Male", date_of_birth: "2002-05-03", citizen_id: 1010101010101, address: "123, ลาดกระบัง", contact_number: "123456789", password: "123456789", password_confirmation: "123456789", role: 0 }).save
      expect(user).to eq(true)
    end
  end

  context "contact number field" do
    it "cannot create with thai format" do 
      user =  User.new({ fullname: "Abulhakim Mah", gender: "Male", date_of_birth: "2002-05-03", citizen_id: 1010101010101, address: "123, ลาดกระบัง", contact_number: "๑๒๓๔๕๖๗๘๙", password: "123456789", password_confirmation: "123456789", role: 0 }).save
      expect(user).to eq(false)
    end
    it "cannot create with 5 digit" do 
      user =  User.new({ fullname: "Abulhakim Mah", gender: "Male", date_of_birth: "2002-05-03", citizen_id: 1010101010101, address: "123, ลาดกระบัง", contact_number: "12345", password: "123456789", password_confirmation: "123456789", role: 0 }).save
      expect(user).to eq(false)
    end
    it "cannot create with 8 digit" do 
      user =  User.new({ fullname: "Abulhakim Mah", gender: "Male", date_of_birth: "2002-05-03", citizen_id: 1010101010101, address: "123, ลาดกระบัง", contact_number: "09123456", password: "123456789", password_confirmation: "123456789", role: 0 }).save
      expect(user).to eq(false)
    end
    it "can create with 9 digit" do 
      user =  User.new({ fullname: "Abulhakim Mah", gender: "Male", date_of_birth: "2002-05-03", citizen_id: 1010101010101, address: "123, ลาดกระบัง", contact_number: "091345678", password: "123456789", password_confirmation: "123456789", role: 0 }).save
      expect(user).to eq(true)
    end
    it "can create with 10 digit" do 
      user =  User.new({ fullname: "Abulhakim Mah", gender: "Male", date_of_birth: "2002-05-03", citizen_id: 1010101010101, address: "123, ลาดกระบัง", contact_number: "0913456789", password: "123456789", password_confirmation: "123456789", role: 0 }).save
      expect(user).to eq(true)
    end
    it "cannot create with 11 digit" do 
      user =  User.new({ fullname: "Abulhakim Mah", gender: "Male", date_of_birth: "2002-05-03", citizen_id: 1010101010101, address: "123, ลาดกระบัง", contact_number: "09134567891", password: "123456789", password_confirmation: "123456789", role: 0 }).save
      expect(user).to eq(false)
    end
    it "cannot create with 15 digit" do 
      user =  User.new({ fullname: "Abulhakim Mah", gender: "Male", date_of_birth: "2002-05-03", citizen_id: 1010101010101, address: "123, ลาดกระบัง", contact_number: "091345678911234", password: "123456789", password_confirmation: "123456789", role: 0 }).save
      expect(user).to eq(false)
    end
  end


  # minimum password is 8 
  context "password field" do
    it "cannot create with 5 digits" do 
      user =  User.new({ fullname: "Abulhakim Mah", gender: "Male", date_of_birth: "2002-05-03", citizen_id: 1010101010101, address: "123, ลาดกระบัง", contact_number: "091345678", password: "12345", password_confirmation: "12345", role: 0 }).save
      expect(user).to eq(false)
    end
    it "cannot create with 7 digits" do 
      user =  User.new({ fullname: "Abulhakim Mah", gender: "Male", date_of_birth: "2002-05-03", citizen_id: 1010101010101, address: "123, ลาดกระบัง", contact_number: "091345678", password: "1234567", password_confirmation: "1234567", role: 0 }).save
      expect(user).to eq(false)
    end
    it "can create with 8 digits" do 
      user =  User.new({ fullname: "Abulhakim Mah", gender: "Male", date_of_birth: "2002-05-03", citizen_id: 1010101010101, address: "123, ลาดกระบัง", contact_number: "091345678", password: "12345678", password_confirmation: "12345678", role: 0 }).save
      expect(user).to eq(true)
    end
    it "can create with 9 digits" do 
      user =  User.new({ fullname: "Abulhakim Mah", gender: "Male", date_of_birth: "2002-05-03", citizen_id: 1010101010101, address: "123, ลาดกระบัง", contact_number: "091345678", password: "123456789", password_confirmation: "123456789", role: 0 }).save
      expect(user).to eq(true)
    end
    it "can create with 12 digits" do 
      user =  User.new({ fullname: "Abulhakim Mah", gender: "Male", date_of_birth: "2002-05-03", citizen_id: 1010101010101, address: "123, ลาดกระบัง", contact_number: "091345678", password: "1234567890", password_confirmation: "1234567890", role: 0 }).save
      expect(user).to eq(true)
    end
  end


end