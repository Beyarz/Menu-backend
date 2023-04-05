class MenuReindexJob < ApplicationJob
  queue_as :default

  def perform
    Menu.reindex
  end
end
