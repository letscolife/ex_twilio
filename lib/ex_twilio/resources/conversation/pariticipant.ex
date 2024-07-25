defmodule ExTwilio.Conversation.Participant do
  @moduledoc """
  Represents an Conversation Participant resource in the Twilio API.

  - [Twilio docs](https://www.twilio.com/docs/conversations/api/conversation-participant-resource)

  ## Examples

  Since Conversation Participant is a nested resource in the Twilio API, you must
  pass in a parent Conversation SID to all functions in this module.

    ExTwilio.Conversation.Participant.all(conversation: "CHXXXX")
    ExTwilio.Conversation.Participant.find(sid, [conversation: "CHXXXX"])

  Here is an example of adding an SMS Participant to a Conversation (note the unusual atom name):

    ExTwilio.Conversation.Participant.create("messaging_binding\.Address": "+16780987654")

  Here's an example of adding a Participant to a conversation that is a Twilio phone number you own:

    ExTwilio.Conversation.Participant.create(
        [
          "messaging_binding\.Projected_address": "+17681234567,
          identity: "some identity
        ],
        [conversation: "CHXXXX"]
      )

  If you are using Service-Scoped resources, you must pass in a Service SID (in addition the conversation)

    ExTwilio.Conversation.Participant.create(
      [
        "messaging_binding\.Address": "+16780987654",
        identity: "some identity"
      ],
      [service: "ISXXXX", conversation: "CHXXXX"]
    )

  """
  defstruct account_sid: nil,
            attributes: nil,
            conversation_sid: nil,
            date_created: nil,
            date_updated: nil,
            identity: nil,
            last_read_message_index: nil,
            last_read_timestamp: nil,
            messaging_binding: nil,
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

  def parents do
    [
      %ExTwilio.Parent{module: ExTwilio.Conversation.Service, key: :service},
      :conversation
    ]
  end

  def resource_name, do: "Participants"
  def resource_collection_name, do: "participants"
end