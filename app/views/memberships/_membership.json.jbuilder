json.extract! membership, :id, :user_id, :invited_by, :effectivity_date, :expiry_date, :created_at, :updated_at
json.url membership_url(membership, format: :json)
