defmodule ExTwilio.Conversation.ParticipantConversation do
  @moduledoc """
  Represents a Participant Conversation resource in the Twilio API.

  - [Twilio docs](https://www.twilio.com/docs/conversations/api/participant-conversation-resource)

  ## Examples

      ExTwilio.Conversation.ParticipantConversation.all(address: "+18889997777")
      ExTwilio.Conversation.ParticipantConversation.all(identity: "unique_identity")

  """
  defstruct account_sid: nil,
            chat_service_sid: nil,
            conversation_attributes: nil,
            conversation_created_by: nil,
            conversation_date_created: nil,
            conversation_date_updated: nil,
            conversation_friendly_name: nil,
            conversation_sid: nil,
            conversation_state: nil,
            conversation_timers: nil,
            conversation_unique_name: nil,
            links: nil,
            participant_identity: nil,
            participant_messaging_binding: nil,
            participant_sid: nil,
            participant_user_sid: nil

  use ExTwilio.Resource, import: [:stream, :all]

  def resource_collection_name, do: "conversations"
end
