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

  @doc """
  Find participants for a given conversation. Any options other than `[conversation: "sid"]` will
  result in a `FunctionClauseError`.

  ## Examples

      ExTwilio.Conversation.Participant.find(participant_sid, [conversation: "sid"])
  """
  @spec find(conversation: String.t()) :: Parser.success() | Parser.error()
  def find(conversation: sid) do
    Api.find(__MODULE__, nil, conversation: sid)
  end

  def parents, do: [:conversation]
  def resource_name, do: "Participants"
  def resource_collection_name, do: "participants"
end
