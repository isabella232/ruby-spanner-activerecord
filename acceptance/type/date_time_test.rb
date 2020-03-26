# frozen_string_literal: true


require "test_helper"

module ActiveRecord
  module Type
    class DateTimeTest < SpannerAdapter::TestCase
      include SpannerAdapter::Types::TestHelper

      def test_datetime_seconds_precision_applied_to_timestamp
        expected_time = ::Time.now
        record = TestTypeModel.new start_datetime: expected_time

        assert_equal expected_time, record.start_datetime
        assert_equal expected_time.usec, record.start_datetime.usec
      end
    end
  end
end