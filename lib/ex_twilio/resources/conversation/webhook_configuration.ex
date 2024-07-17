defmodule ExTwilio.Conversation.WebhookConfiguration do
  @moduledoc """
  Represents a Conversation Webhook Configuration resource in the Twilio API.

  - [Twilio docs](https://www.twilio.com/docs/conversations/api/webhook-configuration-resource)

  ## Examples

  Here is an example of getting Conversation Webhook Configuration:

      ExTwilio.Conversation.WebhookConfiguration.find_config()


  Here is an example of updating Conversation Webhook Configuration:

      ExTwilio.Conversation.WebhookConfiguration.update_config(method: "POST", post_webhook_url: "https://example.com/webhook")

  """
  defstruct account_sid: nil,
            filters: nil,
            method: nil,
            post_webhook_url: nil,
            pre_webhook_url: nil,
            target: nil,
            url: nil

  use ExTwilio.Resource, import: [:find_config, :update_config]

  def parents, do: [:conversation]
  def resource_name, do: "Configuration/Webhooks"
  def resource_collection_name, do: "webhook_configurations"
end
