@managing_promotion_coupons
Feature: Coupon generate instruction validation
    In order to avoid making mistakes when generating coupons for my promotions
    As an Administrator
    I want to be prevented from generating it without specifying required fields

    Background:
        Given the store operates on a single channel in "France"
        And there is a promotion "Christmas sale"
        And it is coupon based promotion
        And I am logged in as an administrator

    @ui
    Scenario: Trying to generate a new coupons without specifying its amount
        Given I want to generate a new coupons for this promotion
        When I do not specify its amount
        And I limit generated coupons usage to 25 times
        And I make generated coupons valid until "26.03.2017"
        And I try to generate it
        Then I should be notified that generate amount is required
        And there should be 0 coupon related to this promotion
