require_relative '../spec_helper'

# rubocop:disable Metrics/BlockLength
RSpec.describe Dotloop::Person do
  let(:client) { Dotloop::Client.new(api_key: SecureRandom.uuid) }
  subject { Dotloop::Person.new(client: client) }

  describe '#initialize' do
    it 'should exist' do
      expect(subject).to_not be_nil
    end

    it 'should set the client' do
      expect(subject.client).to eq(client)
    end
  end

  describe '#all' do
    it 'should return a list of persons' do
      dotloop_mock_batch(:persons)
      persons = subject.all
      expect(persons.size).to eq(52)
      expect(persons).to all(be_a(Dotloop::Models::Person))
      expect(persons.first).to have_attributes(
        email: 'FirstLast@test.com',
        first_name: 'Test FirstName',
        last_name: 'Test LastName',
        person_id: 3_623_822
      )
    end
  end

  describe '#find' do
    it 'should return a single person' do
      dotloop_mock(:person)
      person = subject.find(person_id: 3_603_862)
      expect(person).to be_a(Dotloop::Models::Person)
      expect(person).to have_attributes(
        email: 'brianerwin@newkyhome.com',
        first_name: 'Brian',
        last_name: 'Erwin',
        person_id: 3_603_862
      )
    end
  end
end
