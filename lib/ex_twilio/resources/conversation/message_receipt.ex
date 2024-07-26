defmodule ExTwilio.Conversation.MessageReceipt do
  @moduledoc """
  Represents a Conversation Message Receipt resource in the Twilio API.

  - [Twilio docs](https://www.twilio.com/docs/conversations/api/receipt-resource)

  ## Examples

  Since Conversation Message Receipt is a nested resource in the Twilio API, you must
  pass in a parent Conversation SID and Message SID to all functions in this module.

      ExTwilio.Conversation.Message.create([body: "Hi"], [conversation: "CHXXXX", message: "IMXXXX])
      ExTwilio.Conversation.Message.find(sid, [conversation: "CHXXXX", message: "IMXXXX])

  Here is an example of sending an SMS message in a Conversation:

      ExTwilio.Conversation.MessageReceipt.find(sid, [conversation: "CHXXXX", message: "IMXXXX])])

  If you are using Service-Scoped resources, you must pass in a Service SID (in addition the conversation
  and message) to all functions in this module.

      ExTwilio.Conversation.MessageReceipt.find(sid, [service: "ISXXXX", conversation: "CHXXXX", message: "IMXXXX]

  """
  defstruct account_sid: nil,
            channel_message_sid: nil,
            conversation_sid: nil,
            date_created: nil,
            date_updated: nil,
            error_code: nil,
            message_sid: nil,
            participant_sid: nil,
            sid: nil,
            status: nil,
            url: nil

  use ExTwilio.Resource, import: [:stream, :all, :find]

  def parents do
    [
      %ExTwilio.Parent{module: ExTwilio.Conversation.Service, key: :service},
      :conversation,
      %ExTwilio.Parent{module: ExTwilio.Conversation.Message, key: :message}
    ]
  end

  def resource_name, do: "Receipts"
  def resource_collection_name, do: "delivery_receipts"
end
