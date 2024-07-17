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

  @doc """
  Find messages for a given conversation. Any options other than `[conversation: "CHXXXX"]` will
  result in a `FunctionClauseError`.

  ## Examples

      ExTwilio.Conversation.Message.find(message_sid, [conversation: "CHXXXX"])
  """
  @spec find(conversation: String.t()) :: Parser.success() | Parser.error()
  def find(conversation: sid) do
    Api.find(__MODULE__, nil, conversation: sid)
  end

  def parents, do: [:conversation]
  def resource_name, do: "Messages"
  def resource_collection_name, do: "messages"
end
