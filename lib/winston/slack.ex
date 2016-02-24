defmodule Winston.Slack do
  use Slack

  @token Application.get_env(:winston, __MODULE__)[:token]

  def start_link, do: start_link(@token, [])

  def handle_message(message = %{type: "message", text: text}, slack, state) do
    if String.contains?(text, slack.me.id) do 
      Slack.send_message("I only know this one message", message.channel, slack)
    end

    {:ok, state}
  end
  def handle_message(_message, _slack, state), do: {:ok, state}
end
