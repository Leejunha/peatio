module Benchmark
  class SweatFactory

    @@seq = 0

    class <<self
      def make_member
        @@seq += 1
        member = Member.create!(
          email: "user#{@@seq}@example.com",
          nickname: "Matching Benchmark #{@@seq}"
        )
      end

      def make_order(klass, attrs={})
        klass.new({
          bid: :eur,
          ask: :btc,
          state: Order::WAIT,
          currency: :btceur,
          origin_volume: attrs[:volume],
          source: 'Web',
          ord_type: 'limit'
        }.merge(attrs))
      end
    end

  end
end
