defmodule ExTwilio.Conversation.AddressConfiguration do
  @moduledoc """
  Represents a Conversation Address Configuration resource in the Twilio API.

  - [Twilio docs](https://www.twilio.com/docs/conversations/api/address-configuration-resource)

  ## Examples

  Since Conversation Address Configuration is a nested resource in the Twilio API, you must
  pass in a parent Conversation SID to all functions in this module.

      ExTwilio.Conversation.AddressConfiguration.create([body: "Hi"], [conversation: "CHXXXX"])
      ExTwilio.Conversation.AddressConfiguration.find(sid, [conversation: "CHXXXX"])
  """
  defstruct account_sid: nil,
            address: nil,
            address_country: nil,
            auto_creation: nil,
            date_created: nil,
            date_updated: nil,
            friendly_name: nil,
            sid: nil,
            type: nil,
            url: nil

  use ExTwilio.Resource,
    import: [
      :stream,
      :all,
      :find,
      :create,
      :update,
      :destroy
    ]

  def parents do
    [
      %ExTwilio.Parent{module: ExTwilio.Conversation.Service, key: :service},
      :conversation
    ]
  end

  def resource_name, do: "Configuration/Addresses"
  def resource_collection_name, do: "address_configurations"
end
