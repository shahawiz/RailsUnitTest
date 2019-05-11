require 'rails_helper'

RSpec.describe User, type: :model do
  # User.new(first_name: "Salma", last_name: "Negm", national_id: "29310050200401")
  
  describe '#full_name' do #secenario
    subject { described_class.new(first_name: 'Salma', last_name: 'Negm' ) }

    context 'when user has first_name and last_name' do #test case 1
      it 'returns space separated full name' do
        expect(subject.full_name).to eql 'Salma Negm'
      end
    end

    context 'when user do not has a last_name' do #test case 2
      it 'returns empty string' do
        subject.last_name = nil
        expect(subject.full_name).to eql ''
      end
    end

    #Case last name only
    context 'when user do not has a first_name' do #test case 3
      it 'returns empty string' do
        subject.first_name = nil
        expect(subject.full_name).to eql ''
      end
    end


  end

  describe '#gender_type' do
    context 'when user is female' do
      it 'returns Female' do
        user = User.new(national_id: "29310050200401")
        expect(user.gender_type).to eql 'Female'
      end
    end
  end

  describe '#gender?' do
    context 'when user is female and type is female' do
      it 'returns true' do
        allow(subject).to receive(:gender_type).and_return('Female') #stub
        expect(subject).to receive(:gender_type)

        expect(subject.gender? 'female').to be true
      end
    end
  end
# Check Birthdate with ID
  describe '#birth_date' do
    context 'when user enter valid ID ' do
      it 'returns birthday and date' do
        user = User.new(national_id: "29308099382143")
          expect(user.birth_date).to eql '9/8/1993'.to_date
      end
    end
  end

#Check User Age
describe '#age' do 
  context 'Calculation of age' do
    it 'returns the age ' do
      allow(subject).to receive(:birth_date).and_return('9/8/1993'.to_date)
      expect(subject).to receive(:birth_date)

      expect(subject.age).to eql 26
    end
  end
end

#Check Registeration 
describe '#register' do
  context 'Register succssed' do
    it 'returns hashed password' do
      user = User.new(first_name: "Test", last_name: "test", national_id: "29310050200401",password: "1991973")
      allow(User).to receive(:hashed_password).and_return(user.password)
      expect(user.register).to be true
    end
  end
end

end
