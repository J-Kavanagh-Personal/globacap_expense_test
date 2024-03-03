import React from "react";

const UserComponent = ({ id, name }: { id: number; name: string }) => {
    return (
        <>
            <h3>
                id: {id} - name: {name}
            </h3>
        </>
    );
};

export default UserComponent;