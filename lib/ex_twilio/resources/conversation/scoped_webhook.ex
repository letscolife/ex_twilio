defmodule ExTwilio.Conversation.ScopedWebhook do
  @moduledoc """
  Represents a Conversation Scoped Webhook resource in the Twilio API.

  - [Twilio docs](https://www.twilio.com/docs/conversations/api/conversation-scoped-webhook-resource)

  ## Examples

  Since Conversation Scoped Webhook is a nested resource in the Twilio API, you must
  pass in a parent Conversation SID to all functions in this module.

      ExTwilio.Conversation.ScopedWebhook.create([body: "Hi"], [conversation: "CHXXXX"])
      ExTwilio.Conversation.ScopedWebhook.find(sid, [conversation: "CHXXXX"])

  """
  defstruct account_sid: nil,
            configuration: nil,
            conversation_sid: nil,
            date_created: nil,
            date_updated: nil,
            sid: nil,
            target: nil,
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
  Find scoped webhooks for a given conversation. Any options other than `[conversation: "CHXXXX"]` will
  result in a `FunctionClauseError`.

  ## Examples

      ExTwilio.Conversation.ScopedWebhook.find(message_sid, [conversation: "CHXXXX"])
  """
  @spec find(conversation: String.t()) :: Parser.success() | Parser.error()
  def find(conversation: sid) do
    Api.find(__MODULE__, nil, conversation: sid)
  end

  def parents, do: [:conversation]
  def resource_name, do: "Webhooks"
  def resource_collection_name, do: "webhooks"
end
