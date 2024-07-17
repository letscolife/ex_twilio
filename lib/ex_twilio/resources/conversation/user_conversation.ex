defmodule ExTwilio.Conversation.UserConversation do
  @moduledoc """
  Represents a User Conversation resource in the Twilio API.

  - [Twilio docs](https://www.twilio.com/docs/conversations/api/user-conversation-resource)

  ## Examples

  Since User Conversation is a nested resource in the Twilio API, you must
  pass in a parent User SID and Conversation SID to all functions in this module.
  The one exception is the `all/1` function, which requires a real user SID and
  the conversion SID must be an empty string `""`.

      ExTwilio.Conversation.UserConversation.all(user: "USXXXX", conversation: "")
      ExTwilio.Conversation.UserConversation.find(user: "USXXXX", conversation: "CHXXXX")

  """
  defstruct account_sid: nil,
            attributes: nil,
            chat_service_sid: nil,
            conversation_sid: nil,
            conversation_state: nil,
            created_by: nil,
            date_created: nil,
            date_updated: nil,
            friendly_name: nil,
            last_read_message_index: nil,
            links: nil,
            notification_level: nil,
            participant_sid: nil,
            timers: nil,
            unique_name: nil,
            unread_messages_count: nil,
            url: nil,
            user_sid: nil

  use ExTwilio.Resource,
    import: [
      :stream,
      :all,
      :find,
      :update,
      :destroy
    ]

  @doc """
  Find messages for a given conversation. Any options other than `[user: "sid", conversation: "sid"]` will
  result in a `FunctionClauseError`.

  ## Examples

      ExTwilio.Conversation.UserConversation.find(user: "USXXXX", conversation: "CHXXXX")
  """

  @spec find(user: String.t(), conversation: String.t()) :: Parser.success() | Parser.error()
  def find([user: _, conversation: _] = options) do
    Api.find(__MODULE__, nil, options)
  end

  def parents,
    do: [
      %ExTwilio.Parent{module: ExTwilio.Conversation.User, key: :user},
      :conversation
    ]

  def resource_name, do: ""
  def resource_collection_name, do: "conversations"
end
