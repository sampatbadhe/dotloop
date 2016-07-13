module Dotloop
  module Models
    class Profile
      include Virtus.model

      attribute :active, Boolean
      attribute :address1
      attribute :address2
      attribute :city
      attribute :company_name
      attribute :deleted, Boolean
      attribute :fax_number
      attribute :name
      attribute :phone_number
      attribute :profile_id, Integer
      attribute :profile_type
      attribute :state
      attribute :suite
      attribute :zipcode
      attribute :client, Dotloop::Client
    end
  end
end