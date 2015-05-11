class InitSchema < ActiveRecord::Migration

  def self.up

    create_table :users do |t|
      t.string :name, :null => false
      t.string :mobile, :null => false
      t.string :icon
      t.string :city
      t.string :password
      t.integer :age
      t.float :vibe
      t.timestamps :null => true
    end

    create_table :contacts do |t|
      t.belongs_to :user
      t.integer :user_id
      t.integer :friend_id
      t.timestamps :null => true
    end

    create_table :events do |t|
      t.belongs_to :user
      t.integer :user_id
      t.string :name, :null => false
      t.string :summary
      t.boolean :open, :default => true
      t.integer :mincapacity
      t.integer :maxcapacity
      t.integer :minage
      t.integer :maxage
      t.integer :ratio
      t.float   :minvibe
      t.timestamp :start
      t.timestamp :end
      t.string :gps
      t.string :location
      t.string :map
      t.string :url
      t.integer :payment
      t.integer :cost
      t.timestamps :null => true
    end

    create_table :invites do |t|
      t.belongs_to :event
      t.belongs_to :user
      t.integer :event_id
      t.integer :user_id
      t.integer :invitee
      t.boolean :accepted, :default => false
      t.timestamps :null => true
    end

    create_table :photos do |t|
      t.belongs_to :event
      t.belongs_to :user
      t.integer :event_id
      t.integer :user_id
      t.string :path
      t.timestamps :null => true
    end

    create_table :comments do |t|
      t.belongs_to :user
      t.belongs_to :event
      t.integer :user_id
      t.integer :event_id
      t.string :comment
      t.timestamps :null => true
    end

    create_table :ratings do |t|
      t.belongs_to :user
      t.belongs_to :event
      t.integer :user_id
      t.integer :event_id
      t.integer :rating
      t.timestamps :null => true
    end

  end

  def self.down

    drop_table :users
    drop_table :contacts
    drop_table :events
    drop_table :invites
    drop_table :photos
    drop_table :comments
    drop_table :ratings

  end

end

