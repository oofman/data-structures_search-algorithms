hsh = { abc: 'hello', 'another_key' => 123, 4567 => 'third' }
p hsh.keys.map(&:to_s).sort_by(&:length)
p hsh.keys.collect(&:to_s).sort_by { |key| key.length }
