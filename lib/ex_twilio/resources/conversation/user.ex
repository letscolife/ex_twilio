defmodule ExTwilio.Conversation.User do
  @moduledoc """
  Represents a Conversation User resource in the Twilio API.

  - [Twilio docs](https://www.twilio.com/docs/conversations/api/user-resource)

  ## Examples

  Here is an example of creating a User for a Conversation:

      ExTwilio.Conversation.User.create(identity: "unique_identity")

  """
  defstruct account_sid: nil,
            attributes: nil,
            chat_service_sid: nil,
            date_created: nil,
            date_updated: nil,
            friendly_name: nil,
            identity: nil,
            is_notifiable: nil,
            is_online: nil,
            links: nil,
            role_sid: nil,
            sid: nil,
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

  def parents, do: [:conversation]
  def resource_name, do: "Users"
  def resource_collection_name, do: "users"
end
