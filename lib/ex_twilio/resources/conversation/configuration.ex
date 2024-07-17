defmodule ExTwilio.Conversation.Configuration do
  @moduledoc """
  Represents a Conversation Configuration resource in the Twilio API.

  - [Twilio docs](https://www.twilio.com/docs/conversations/api/configuration-resource)

  ## Examples

  Here is an example of getting the Conversation Configuration:

      ExTwilio.Conversation.Configuration.find_config()

  To update the configuration:

      ExTwilio.Conversation.Configuration.update_config(default_conversation_role_sid: chat_service_sid)

  """
  defstruct chat_service_sid: nil,
            default_chat_service_role_sid: nil,
            default_conversation_creator_role_sid: nil,
            default_conversation_role_sid: nil,
            links: nil,
            reachability_enabled: nil,
            url: nil

  use ExTwilio.Resource, import: [:find_config, :update_config]

  alias ExTwilio.UrlGenerator, as: Url
  alias ExTwilio.{Api, Parser}

  def parents, do: [:conversation]
  def resource_name, do: "Configuration"
end
