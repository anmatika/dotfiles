module.exports = {
    "parser": "babel-eslint",
    "env": {
        "browser": true,
        "node": true
    },
    "settings": {
        "import/resolver": {
            "node": {
                "paths": [
                    __dirname
                ]
            }
        }
    },
    "extends": "airbnb",
    "rules": {
        "indent": ["error", 4],
        "react/jsx-indent": ["error", 4],
        "no-unused-vars": ["warn", { "vars": "all", "args": "after-used" }],
        "linebreak-style": ["off"],
        "no-underscore-dangle": ["off"],
        "comma-dangle": ["off"],
        "quotes": ["off"],
        "max-len": ["off"],
        "no-plusplus": ["off"],
        "no-use-before-define": ["off"],
        "no-new": ["off"],
        "react/jsx-uses-vars": ["error"],
        "react/prefer-es6-class": ["off"],
        "import/extensions": ["off"],
        "quotes": ["error", "single"],
        "import/no-unresolved": ["error", { caseSensitive: false }],
        "no-confusing-arrow": ["off"],
        "padded-blocks": ["off"]
    }
};
