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

  @doc """
  Find messages for a given conversation. Any options other than `[conversation: "sid"]` will
  result in a `FunctionClauseError`.

  ## Examples

      ExTwilio.Conversation.AddressConfiguration.find(message_sid, [conversation: "sid"])
  """
  @spec find(conversation: String.t()) :: Parser.success() | Parser.error()
  def find(conversation: sid) do
    Api.find(__MODULE__, nil, conversation: sid)
  end

  def parents, do: [:conversation]
  def resource_name, do: "Configuration/Addresses"
  def resource_collection_name, do: "address_configurations"
end
