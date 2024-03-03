import React from "react";

const ExpenseComponent = ({ id, amount }: { id: number; amount: number }) => {
    return (
        <>
            <h4>
                id: {id} - {amount}
            </h4>
        </>
    );
};

export default ExpenseComponent;