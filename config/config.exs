use Mix.Config

 config :winston, Winston.Slack,
   token: System.get_env("WINSTON_SLACK_TOKEN") 
