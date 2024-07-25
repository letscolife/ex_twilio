defmodule ExTwilio.Conversation do
  @moduledoc """
  Represents an Conversation resource in the Twilio API.

  - [Twilio docs](https://www.twilio.com/docs/conversations/api/conversation-resource)

  ## Examples

  Here is an example of creating a Conversation:

      {:ok, conversation} = ExTwilio.Conversation.create(friendly_name: "My First Conversation")

  Once the conversation is created, you'll want to add participants and send a message.

  If you are using Service-Scoped resources, you must pass the service sid to all functions in this module.

      {:ok, conversation} = ExTwilio.Conversation.create(friendly_name: "My First Conversation", service: "ISXXXX")

  """
  defstruct account_sid: nil,
            attributes: nil,
            bindings: nil,
            chat_service_sid: nil,
            date_created: nil,
            date_updated: nil,
            friendly_name: nil,
            links: nil,
            messaging_service_sid: nil,
            sid: nil,
            state: nil,
            timers: nil,
            unique_name: nil,
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
    [%ExTwilio.Parent{module: ExTwilio.Conversation.Service, key: :service}]
  end
end
