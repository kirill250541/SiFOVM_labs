library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity LABA1 is
    Port (
        C  : in  STD_LOGIC;                    -- Тактовый сигнал
        D0 : in  STD_LOGIC;                    -- Вход данных
        Q  : out STD_LOGIC_VECTOR(7 downto 0)  -- Выходы Q0...Q7
    );
end LABA1;

architecture Behavioral of LABA1 is
    -- Внутренний сигнал для хранения состояния регистра
    signal shift_reg : STD_LOGIC_VECTOR(7 downto 0) := (others => '0');
begin

    process(C)
    begin
        -- Срабатывание по переднему фронту тактового сигнала
        if rising_edge(C) then
            -- Сдвигаем данные: новый бит в Q0, остальные смещаются
            -- Q(7) получает значение Q(6), Q(1) получает Q(0) и т.д.
            shift_reg <= shift_reg(6 downto 0) & D0;
        end if;
    end process;

    -- Назначаем внутренний регистр на выходные порты
    Q <= shift_reg;

end Behavioral;

