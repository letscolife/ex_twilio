defmodule ExTwilio.Conversation.Role do
  @moduledoc """
  Represents an Conversation Role resource in the Twilio API.

  - [Twilio docs](https://www.twilio.com/docs/conversations/api/role-resource)

  ## Examples

  Here is an example of finding all the defined Roles

      ExTwilio.Conversation.Roles.all()

  Here is an example of creating a new Role

      ExTwilio.Conversation.Roles.create(permission: "addParticipant", type "conversation", friendly_name: "FriendlyName")

  If using a Scoped Service, you can must pass the service sid  to all functions in this module.

      ExTwilio.Conversation.Roles.all(service: "ISXXXX")

  """
  defstruct account_sid: nil,
            chat_service_sid: nil,
            date_created: nil,
            date_updated: nil,
            friendly_name: nil,
            permissions: nil,
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
      %ExTwilio.Parent{module: ExTwilio.Conversation.Service, key: :service}
    ]
  end

  def resource_name, do: "Roles"
  def resource_collection_name, do: "roles"
end
