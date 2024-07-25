defmodule ExTwilio.Conversation.ScopedWebhook do
  @moduledoc """
  Represents a Conversation Scoped Webhook resource in the Twilio API.

  - [Twilio docs](https://www.twilio.com/docs/conversations/api/conversation-scoped-webhook-resource)

  ## Examples

  Since Conversation Scoped Webhook is a nested resource in the Twilio API, you must
  pass in a parent Conversation SID to all functions in this module.

      ExTwilio.Conversation.ScopedWebhook.create([body: "Hi"], [conversation: "CHXXXX"])
      ExTwilio.Conversation.ScopedWebhook.find(sid, [conversation: "CHXXXX"])

  If you use Service-Scoped resources, you must pass in a Service SID (in addition to the conversation)

      ExTwilio.Conversation.ScopedWebhook.create([body: "Hey"], [service: "ISXXXX", conversation: "CHXXXX"])
      ExTwilio.Conversation.ScopedWebhook.find("IMXXXX", [service: "ISXXXX", conversation: "CHXXXX"])
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

  def parents do
    [
      %ExTwilio.Parent{module: ExTwilio.Conversation.Service, key: :service},
      :conversation
    ]
  end

  def resource_name, do: "Webhooks"
  def resource_collection_name, do: "webhooks"
end
