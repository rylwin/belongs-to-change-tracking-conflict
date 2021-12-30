# frozen_string_literal: true

require "bundler/inline"

gemfile(true) do
  source "https://rubygems.org"
  git_source(:github) { |repo| "https://github.com/#{repo}.git" }
  # Activate the gem you are reporting the issue against.
  gem "activerecord", "~> 7.0.0"
  gem "sqlite3"
end

require "active_record"
require "minitest/autorun"
require "logger"

# This connection will do for database-independent bug reports.
ActiveRecord::Base.establish_connection(
  adapter: "sqlite3",
  database: ":memory:",
)
ActiveRecord::Base.logger = Logger.new(STDOUT)

ActiveRecord::Schema.define do
  create_table :records, force: true do |t|
  end

  create_table :entries, force: true do |t|
    t.integer :record_id
  end

  create_table :details, force: true do |t|
    t.integer :entry_id
  end
end

class Record < ActiveRecord::Base
  has_many :entries
end

class Entry < ActiveRecord::Base
  belongs_to :record
  has_one :detail
end

class Detail < ActiveRecord::Base
  belongs_to :entry
end

class BugTest < Minitest::Test
  def test_association_stuff
    Entry.create(record: Record.new, detail: Detail.new)
  end
end
