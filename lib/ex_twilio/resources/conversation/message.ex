defmodule ExTwilio.Conversation.Message do
  @moduledoc """
  Represents a Conversation Message resource in the Twilio API.

  - [Twilio docs](https://www.twilio.com/docs/conversations/api/conversation-message-resource)

  ## Examples

  Since Conversation Message is a nested resource in the Twilio API, you must
  pass in a parent Conversation SID to all functions in this module.

      ExTwilio.Conversation.Message.create([body: "Hi"], [conversation: "CHXXXX"])
      ExTwilio.Conversation.Message.find("IMXXXX", [conversation: "CHXXXX"])

  Here is an example of sending an SMS message in a Conversation:

  Note: You need to create the conversation and add the participants before sending a message.

      {conversation_sid, author, body} = {"CHXXXX", "Steve", "Hello World"}

      ExTwilio.Conversation.Message.create([author: author, body: body], [conversation: conversation_sid]])

  If you are using Service-Scoped resources, you must pass in a Service SID (in addition the conversation)
  to all functions in this module.

      ExTwilio.Conversation.Message.create([body: "Hi"], [service: "ISXXXX", conversation: "CHXXXX"])
      ExTwilio.Conversation.Message.find("IMXXXX", [service: "ISXXXX", conversation: "CHXXXX"])

  """
  defstruct account_sid: nil,
            attributes: nil,
            author: nil,
            body: nil,
            content_sid: nil,
            conversation_sid: nil,
            date_created: nil,
            date_updated: nil,
            delivery: nil,
            index: nil,
            links: nil,
            media: nil,
            participant_sid: nil,
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

  def parents do
    [
      %ExTwilio.Parent{module: ExTwilio.Conversation.Service, key: :service},
      :conversation
    ]
  end

  def resource_name, do: "Messages"
  def resource_collection_name, do: "messages"
end
