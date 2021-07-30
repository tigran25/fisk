# frozen_string_literal: true

class Fisk
  module Instructions
    # Instruction SFENCE
    forms = []
    operands = [
    ].freeze
    encodings = [
      Class.new(Fisk::Encoding) {
        def encode buffer, operands
          add_opcode(buffer, 0x0F, 0) +
          add_opcode(buffer, 0xAE, 0) +
          add_opcode(buffer, 0xF8, 0) +
          0
        end
      }.new.freeze,
    ].freeze
    # sfence: 
    forms << Form.new(operands, encodings)
    SFENCE = Instruction.new("SFENCE", forms)
  end
end
