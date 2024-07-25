defmodule ExTwilio.Conversation.Service do
  @moduledoc """
  Represents a Service for Service-Scoped resources in the Twilio API.

  - [Twilio docs](https://www.twilio.com/docs/conversations/api/service-conversation-resource)

  Use the service scope for the other modules in the Conversation namespace.

  """

  defstruct sid: nil

  use ExTwilio.Resource, import: []

  def parents, do: [:account]
  def resource_name, do: "Services"
  def resource_collection_name, do: "services"
end
