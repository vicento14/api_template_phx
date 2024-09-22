defmodule ApiTemplatePhx.Repo do
  use Ecto.Repo,
    otp_app: :api_template_phx,
    adapter: Ecto.Adapters.MyXQL
end