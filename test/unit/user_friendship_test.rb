require 'test_helper'

class UserFriendshipTest < ActiveSupport::TestCase
	should belong_to(:user)
	should belong_to(:friend)

	test "that creating a fridnship works without raising an exception" do
		assert_nothing_raised do
			UserFriendship.create user: users(:one), friend: users(:three)
		end
	end

	test 'that creating a friendship based on user id and fridn id works' do
		UserFriendship.create user_id: users(:one).id, friend_id: users(:three).id
		assert users(:one).friends.include?(users(:three))
	end
end
