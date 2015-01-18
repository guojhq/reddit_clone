FactoryGirl.define do
  factory :user do
    name "Douglas Adams"
    sequence(:email, 100) { |n| "person#{n}@example.com" }
    password "helloworld"
    password_confirmation "helloworld"
    confirmed_at Time.now

    # Inheritance factory
    factory :user_with_posts_and_comments do
      transient do
        posts_count 1
        comments_count 1
      end

      after(:build) do |user, evaluator|
        create_list(:post, evaluator.posts_count, user: user)
        create_list(:comment, evaluator.comments_count, user: user)
      end
    end
  end

end
