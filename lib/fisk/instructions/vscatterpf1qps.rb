# frozen_string_literal: true

class Fisk
  module Instructions
    # Instruction VSCATTERPF1QPS
    forms = []
    operands = []
    encodings = []
    # vscatterpf1qps: vm64z{k}
    operands << OPERAND_TYPES[91]
    encodings << Class.new(Fisk::Machine::Encoding) {
      def encode buffer, operands
        add_EVEX buffer, operands
        add_opcode buffer, 0xC7, 0
        add_modrm(buffer, operands,
              0,
              6,
              operands[0].value)
      end

      def bytesize; 2; end
    }.new
    forms << Fisk::Machine::Form.new(operands, encodings)
    VSCATTERPF1QPS = Fisk::Machine::Instruction.new("VSCATTERPF1QPS", forms)
  end
end
