console.log('Loading function');

export const handler = async (event, context) => {
    return {
        statusCode: 200,
        body: JSON.stringify(
            {
                message: "Hello, World! Aaron Lim",
            },
          null,
          2
        ),
    };
};
